# GoodLinks JSON to CSV Converter (PowerShell)

A tiny, zero-dependency PowerShell script that converts your GoodLinks export (JSON) into a clean, Excel-ready CSV file.

### What the script does
- Reads any `GoodLinks-Export-*.json` file  
- Creates a CSV with **exactly** these five columns (in this order):  
  `URL,Title,Selection,Folder,Timestamp`  
- `Selection` → always empty (ready for your own notes)  
- `Folder` → always `Goodlinks` (perfect for import filters)  
- `Timestamp` → original Unix timestamp from GoodLinks  
- Output is **comma-separated** with **UTF-8 BOM** → opens perfectly in Excel (CH/DE/AT/US) without any strange characters

### Requirements
- Windows 10/11 (PowerShell 5.1 pre-installed) **or**  
- macOS / Linux with PowerShell 7+ (`pwsh`)  
- No extra modules required

### How to use
1. Save the script as `Convert-GoodLinks.ps1`  
2. Put your GoodLinks JSON export (e.g. `GoodLinks-Export-2025-11-19-09-42.json`) in the **same folder**  
3. Double-click the `.ps1` file → done!  
   The CSV will appear next to the JSON file with the same name.

Or run it in a terminal:
```powershell
.\Convert-GoodLinks.ps1
