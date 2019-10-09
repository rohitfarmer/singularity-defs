# Definition/Recipe Files for Singularity Containers
Some of the containers are available to download from [https://cloud.sylabs.io/library/rohitfarmer](https://cloud.sylabs.io/library/rohitfarmer)

For feedback and collaboration write to me at [rohit.farmer@gmail.com](mailto:rohit.farmer@gmail.com)

# Install Singularity on Linux
## Singularity Version 3.4
Follow the instructions on [https://sylabs.io/guides/3.4/user-guide/quick_start.html#quick-installation-steps](https://sylabs.io/guides/3.4/user-guide/quick_start.html#quick-installation-steps)

# Building a Singularity Container
## Readonly Container
To build a read-only SquashFS Singularity container on a local machine using a recipe/definition file.  

`sudo singularity build <container-name.sif> <Singularity.def>`

## Writable Sandbox
To build a writable sandbox (essentially a folder) on a local machine using a recipe/definition file.  

`sudo singularity build --sandbox  <sandbox-folder-name/> <Singularity.def>`

*Note: The advantage of building a writable sandbox is that it can be used to install and configure packages as you go, and once you are satisfied with the requirements, the sandbox can be converted into a read-only SquashFS container. To build a sandbox quickly, it's better to install a minimal set of packages via the definition file.*  

### Install/Configure Packages in a Writable Sandbox
Once a writable sandbox is created to execute it to invoke the shell of the operating installed in the container in the "writable" mode. If the shell is not invoked in the "writable" mode, all the changes will be lost once you exit from the container environment.  

`sudo singularity shell --writable <sandbox-folder-name/>`

Install packages as you would, for example, in Ubuntu from the command line.

## Convert a Writable Sandbox to a Readonly Container

`sudo singularity build <container-name.sif> <sandbox-folder-name/>`

# Execute a Container
## Invoke a shell 
The command below can be used for both read-only/writable containers/sandbox.  

`singularity shell <container-name.sif>`  

*Note: By default, Singularity binds to your current working and home directory. Therefore, you do not need to do anything else to execute a script that is in your current working directory. It can also pull, for example, Vim settings from the .vimrc file in your home directory. Therefore, if Vim installed in the container, it can be used with the same settings from inside the container as it would from outside.*

## Execute a Command via Container

`singularity exec <container-name.sif> <command>`

For example: `singularity exec <container-name.sif> Rscript --vanilla hello.R`  
