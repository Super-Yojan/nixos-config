self: super: {
	st = super.st.overrideAttrs(
	_:{
		src = super.fetchFromGitHub{
			owner = "Super-Yojan";
			repo = "st";
      rev = "f77e9a1c3b41c9971a5574e3d8e25e511f0f5fe7";
		  sha256 = "sha256-Ejd+mrsUaL3qOVOElvAKNx/g5TLo6wRjAUjQBWhzujs=";
		};
	}
);
}