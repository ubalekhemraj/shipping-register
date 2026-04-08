# 🏥 Medical Shop Shipping Register

A full-stack web application built with Python Reflex.

---

## Requirements

- Python 3.11 or higher
- Internet connection (first run only, to download Reflex frontend)

---

## First-Time Setup & Run

### Windows
Double-click **`setup_and_run.bat`**, or open a terminal in this folder and run:
```
setup_and_run.bat
```

### Mac / Linux
Open a terminal in this folder and run:
```bash
chmod +x setup_and_run.sh
./setup_and_run.sh
```

---

## After First Setup (daily use)

Just open a terminal in this folder and run:
```
reflex run
```
Then open **http://localhost:3000** in your browser.

---

## Features

| Feature | Details |
|--------|---------|
| Add entries | Name, Date/Time, From, To, Shipping Address, Cartons, Company |
| Auto timestamp | Date & Time auto-fills to current time |
| Filter by date | View any date range — today, this week, custom |
| Delete entries | Remove incorrect entries |
| Summary cards | Total entries, total cartons, companies |
| Export to Excel | Beautiful formatted .xlsx with data + summary sheet |

---

## Data Storage

All data is stored locally in `shipping_register.db` (SQLite) in this folder.  
No internet required after first setup.

---

## Excel Export

Exported files are saved in `assets/exports/` and automatically download to your browser.  
Each file is named: `shipping_register_YYYY-MM-DD_to_YYYY-MM-DD.xlsx`
