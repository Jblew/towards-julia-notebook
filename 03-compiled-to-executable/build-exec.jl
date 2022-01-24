import Pkg, PackageCompiler
Pkg.activate("TowardsNotebook")
PackageCompiler.create_app("TowardsNotebook", "TowardsNotebookCompiled")