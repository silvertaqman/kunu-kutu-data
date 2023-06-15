#!/usr/bin/env python3
import xlrd
import csv
import sys

def ExceltoCSV(excel_file, csv_file_base_path):
    workbook = xlrd.open_workbook(excel_file)
    for sheet_name in workbook.sheet_names()[0:13]:
        print('processing -', sheet_name)
        worksheet = workbook.sheet_by_name(sheet_name)
        csv_file_full_path = csv_file_base_path + sys.argv[1].lower()[:-5:].replace(" ","_") +"_"+ sheet_name.lower().replace(" - ", "_").replace(" ","_")+'.csv'
        with open(csv_file_full_path, 'w', newline='') as csvfile:
            writetocsv = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
            for rownum in range(worksheet.nrows):
                writetocsv.writerow(
                    [x.encode('utf-8') if isinstance(x, str) else x for x in worksheet.row_values(rownum)]
                )
        print(sheet_name, 'has been saved at -', csv_file_full_path)

if __name__ == '__main__':
    ExceltoCSV(excel_file=sys.argv[1], csv_file_base_path=sys.argv[2])

