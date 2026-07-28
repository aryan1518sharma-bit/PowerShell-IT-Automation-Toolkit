System Health Report Script
📌 Overview
This PowerShell script generates a simple System Health Report in HTML format.
It collects information about CPU usage, RAM utilization, and disk space on the system, then outputs a structured report that can be opened in any web browser.

⚙️ Features
CPU Usage: Captures current processor utilization percentage.

RAM Statistics: Displays total, free, and used memory in GB.

Disk Space: Lists available and total disk space for all logical drives.

HTML Output: Creates a clean, browser‑friendly report.

🚀 Usage
Run the script in PowerShell:

powershell
.\script.ps1 -OutputPath "report.html"
OutputPath (optional): Path where the HTML report will be saved.
Default: report.html in the current directory.

📄 Example Output
The generated report includes:

CPU Usage section with percentage.

RAM section showing total, free, and used memory.

Disk Space table with drive letters, free space, and total capacity.

Open the report.html file in any browser to view the formatted report.

🛠 Requirements
Windows PowerShell 5.1 or PowerShell Core (7+)

CIM cmdlets (Get-CimInstance) available

Sufficient permissions to query system performance counters

🔍 Notes
The script uses Get-Counter for CPU stats and Get-CimInstance for OS and disk information.

Disk drives are filtered to DriveType=3 (local disks).

Values are rounded to two decimal places for readability.

📜 License
This project is open-source. Feel free to modify and adapt it for your own use.
