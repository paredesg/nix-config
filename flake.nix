{
  description = "Configuration NixOS multi-host / multi-user (aquarius, laptop) avec Home Manager et Qtile";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";

    # Fonction générique de construction d'un host.
    # `users` = liste des noms d'utilisateurs Home Manager actifs sur ce host.
    mkHost = { hostname, users }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/${hostname}

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users =
              nixpkgs.lib.genAttrs users (u: import ./users/${u}/home.nix);
          }
        ];
      };
  in {
    nixosConfigurations = {
      # aquarius : desktop fixe, partagé par eve et bob
      aquarius = mkHost {
        hostname = "aquarius";
        users = [ "eve" "bob" ];
      };

      # laptop : partagé par eve et bob
      laptop = mkHost {
        hostname = "laptop";
        users = [ "eve" "bob" ];
      };

      # vm : partagé par eve et bob
      vm = mkHost {
        hostname = "vm";
        users = [ "eve" "bob" ];
      };
    };
  };
}