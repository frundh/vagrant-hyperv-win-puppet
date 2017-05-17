# puppet-dotnet

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What is the dotnet module?](#module-description)
3. [Setup - The basics of getting started with dotnet](#setup)
    * [What dotnet affects](#what-dotnet-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with dotnet](#beginning-with-dotnet)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module for installing and managing [Microsoft .NET framework](http://www.microsoft.com/net).

[![Build Status](https://travis-ci.org/voxpupuli/puppet-dotnet.svg?branch=master)](https://travis-ci.org/voxpupuli/puppet-dotnet)
[![Puppet Forge](http://img.shields.io/puppetforge/v/puppet/dotnet.svg)](https://forge.puppet.com/puppet/dotnet)
[![Puppet Forge Downloads](http://img.shields.io/puppetforge/dt/puppet/dotner.svg)](https://forge.puppetlabs.com/puppet/dotnet)

## Module Description

This module installs and configures the Microsoft .NET framework on Windows systems. It support side-by-side installs where appropriate.

## Setup

### What dotnet affects

* Installs the .net framework package or the windows server role.

### Beginning with dotnet

Installing the .net 3.5 server role on windows server:

```puppet
  dotnet { 'dotnet35': version => '3.5' }
```

Installing .net 4.5:

```puppet
  dotnet { 'dotnet45':
    version => '4.5'
    deployment_root => 'Z:\packages'
  }
```

## Usage

### Classes and Defined Types:

#### Defined Type: `dotnet`
The dotnet module primary definition, `dotnet` install and configures the .net framework packages/roles

**Parameters within `dotnet`:**
##### `ensure`
Ensures the state of .net on the system. Present or Absent.

##### `version`
The version of .net that you want to be managed by this definition.

##### `package_dir`
If installing .NET from a directory or a mounted network location then this is
that directory. If the version of .NET being installed is a Windows feature, it
may sometimes be necessary to specify package\_dir as the path to installation
media, such as `D:\sources\sxs`.

## Reference

### Definitions
### Public Definitions
* [`dotnet`](#define_dotnet): Guides the basic management of the .net framework on the system.

### Private Definitions
* [`dotnet::install::feature`](#define-install_feature): Installs dotnet as windows feature (.net 3.5)
* [`dotnet::install::package`](#define-install_package): Installs dotnet from a downloaded package.

## Limitations

This module is tested on the following platforms:

* Windows 2008 R2

It is tested with the OSS version of Puppet only.

## Development

### Contributing

Please read CONTRIBUTING.md for full details on contributing to this project.
