self: super: {
	dwm = super.dwm.overrideAttrs(
	old :{
		src = super.fetchFromGitHub{
			owner = "Super-Yojan";
			repo = "dwm";
			rev = "abee295539094ab954a69dc1aabeb5fe1bfaf704";
		  sha256 = "sha256-Ejd+mrsUaL3qOVOElvAKNx/g5TLo6wRjAUjQBWhzujs=";
		};
	}
);
}


