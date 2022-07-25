## Purpose

Simple configuration for a TODO list and PC monitoring using conky.

## Requirements

This is a basic script that works for NVIDIA GPUs, and it's compatible with nvidia-optimus. 

The following packages are required: 

- conky
- nvidia-smi
- sensors

## Installation and Usage

- Clone the repository
- Run the simple_conky_install.sh script (the files are copied to $HOME/.conky/)
- Run $HOME/.conky/Simple Conky/conky_loader to run it 

(it's possible to launch TODO and Status separately with conky -c $HOME/.conky/Simple Todo/simple_[status/todo] )
