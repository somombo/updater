# Updater
Windows packager manager updater script that updates Nodejs/NPM, Miniconda, and the rest of the Chocolatey packages installed on system.

## To 'install'
Add the files `./upd` and `./upd.cmd` somewhere on your `%Path%`/`$PATH`. 
We recommend adding them to `C:\tools\updater` (create that directory if necessary) and then adding `C:\tools\updater` to your `%Path%`/`$PATH`.

## To Run
simply run the following command in cmd or powershell
> Ensure you run the command with administrative or elevated priviledges
```cmd
>> upd
```

### Extra Command Line Parameters
Here are examples of usage.

For current version:
```cmd
>> upd -v
>> upd --version
```

For help:
```cmd
>> upd -h
>> upd --help
```