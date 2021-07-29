#Show the help for Out-Printer
Help out-printer

#List the printers present on the computer
Get-Printer

#Send data to a printer using Out-Printer
Get-process | out-printer -name "Microsoft Print to PDF"
Explorer C:\Docs

#Show the ability to send formatted data to the printer
Get-process | Format-List | out-printer -name "Microsoft Print to PDF"