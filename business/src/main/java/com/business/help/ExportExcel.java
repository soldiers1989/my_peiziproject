package com.business.help;


import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.base.util.WebUtils;

/**
 * 利用开源组件POI3.0.2动态导出EXCEL文档
 */
public class ExportExcel {
    public static final String FILE_SEPARATOR = System.getProperties().getProperty("file.separator");

    /**
     * @param title    excelsheet名称
     * @param headers  thead
     * @param jarray   json 返回的jarray
     * @param infields 传入的 要显示的字段
     * @Description: 根据接口 生成 相应的 excel
     * @author cheng.hao
     */
    public static void exportExcel(String title, String[] headers, JSONArray jarray, String[] infields, OutputStream out) throws Exception {
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个sheet 并设置名称
        HSSFSheet sheet = workbook.createSheet(title);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 20);
        //sheet.setDefaultRowHeightInPoints((float)1.4) ;
        // 生成一个样式
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 生成一个字体
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
    /*// 声明一个画图的顶级管理器
	HSSFPatriarch patriarch = sheet.createDrawingPatriarch();*/
        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }
        // 遍历集合数据，产生数据行
        // Iterator<T> it = dataset.iterator();
        int sames = 0;
        JSONArray j_array_combile = new JSONArray();
        for (int i = 0; i < jarray.size(); i++) {
            j_array_combile.add(jarray.getJSONObject(i));
            // 是否是最后一条记录的开关
            boolean last = (i == jarray.size() - 1);
            // 取出相邻的两条记录进行比较
            JSONObject csl1 = null;
            JSONObject csl2 = null;
            if (!last) {
                csl1 = jarray.getJSONObject(i);
                csl2 = jarray.getJSONObject(i + 1);
            } else {
                // 防止最后一条记录无法加入集合
                csl1 = jarray.getJSONObject(i);
                if (jarray.size() != 1)
                    csl2 = jarray.getJSONObject(i - 1);
                else
                    csl2 = jarray.getJSONObject(i);
            }
            // 默认 是 表头的  第一个字段 进行合并  （单元格第一列，名称一样的单元格合并）
//            if (!csl1.get(infields[0]).toString().equals(csl2.get(infields[0]).toString())) {
//                JSONObject t_jobj = new JSONObject();
//                t_jobj.put("sames", sames);
//                j_array_combile.add(t_jobj);
//                sames = 0;
//            } else {
                sames++; //
//            }
        }

        int index = 0;
        for (int i = 0; i < j_array_combile.size(); i++) {
            JSONObject jobj = j_array_combile.getJSONObject(i);
            if (jobj.get("sames") == null) {
                index++;
                row = sheet.createRow(index);
                // 根据传入的 字段数组 取值
                int cellIndex = 0;
                for (String field : infields) {
                    HSSFCell cell = row.createCell(cellIndex);
                    cell.setCellStyle(style2);
                    Object value = jobj.get(field);
                    // 判断值的类型后进行强制类型转换
                    String textValue = "";
                    if (!WebUtils.isEmpty(value)) {
                        textValue = value.toString();
                    }
                    if (textValue != null) {
                        Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                        Matcher matcher = p.matcher(textValue);
                        if (matcher.matches()) {
                            // 是数字当作double处理
                            cell.setCellValue(Double.parseDouble(textValue));
                        } else {
//                            HSSFRichTextString richString = new HSSFRichTextString(textValue);
//                            HSSFFont font3 = workbook.createFont();
//                            font3.setColor(HSSFColor.BLUE.index);
//                            richString.applyFont(font3);
//                            cell.setCellValue(richString);

                            cell.setCellValue(textValue);
                        }
                    }
                    cellIndex++;
                }

            } else {
                int same = jobj.getInt("sames");
                // 进行合并
                if (same != 0)
                    sheet.addMergedRegion(new CellRangeAddress((index - same), index, 0, 0));//  横向 合并    第几行 到第几行  第几列 到第几列

            }
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void exportExcel(String title, String[] headers, JSONArray jarray, OutputStream out) throws Exception {
        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个sheet 并设置名称
        HSSFSheet sheet = workbook.createSheet(title);
        // 设置表格默认列宽度为15个字节
        sheet.setDefaultColumnWidth((short) 20);
        // sheet.setDefaultRowHeightInPoints((float)1.4) ;
        // 生成一个样式
        HSSFCellStyle style = workbook.createCellStyle();
        // 设置这些样式
        style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 生成一个字体
        HSSFFont font = workbook.createFont();
        font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        // 把字体应用到当前的样式
        style.setFont(font);
        // 生成并设置另一个样式
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
		/*
		 * // 声明一个画图的顶级管理器 HSSFPatriarch patriarch =
		 * sheet.createDrawingPatriarch();
		 */
        // 产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for (short i = 0; i < headers.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        int index = 0;
        for (int i = 0; i < jarray.size(); i++) {
            JSONArray rjarray = jarray.getJSONArray(i);
            index++;
            row = sheet.createRow(index);
            // 根据传入的 字段数组 取值
            int cellIndex = 0;
            for (int j = 0; j < rjarray.size(); j++) {
                HSSFCell cell = row.createCell(cellIndex);
                cell.setCellStyle(style2);
                Object value = rjarray.get(j);
                // 判断值的类型后进行强制类型转换
                String textValue = "";
                if (!WebUtils.isEmpty(value)) {
                    textValue = value.toString();
                }
                if (textValue != null) {
                    Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                    Matcher matcher = p.matcher(textValue);
                    if (matcher.matches()) {
                        // 是数字当作double处理
                        cell.setCellValue(Double.parseDouble(textValue));
                    } else {
                        HSSFRichTextString richString = new HSSFRichTextString(
                                textValue);
                        HSSFFont font3 = workbook.createFont();
                        font3.setColor(HSSFColor.BLUE.index);
                        richString.applyFont(font3);
                        cell.setCellValue(richString);
                    }
                }
                cellIndex++;
            }
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 当导入有错误时，调用此方法生成错误的excel
     * @param os
     * @param title
     * @param jsonArray
     */
    public static void createErrorExcel(OutputStream os,String[] title,JSONArray jsonArray) {
        try {
            WritableWorkbook wbook = Workbook.createWorkbook(os); //建立excel文件
            WritableSheet wsheet = wbook.createSheet("产品包导入错误原因", 0); //工作表名称
            wsheet.setColumnView(0, 30);
            wsheet.setColumnView(1, 50);

            //设置Excel字体
            WritableFont wfont = new WritableFont(WritableFont.ARIAL, 16,
                    WritableFont.BOLD, false,
                    jxl.format.UnderlineStyle.NO_UNDERLINE,
                    jxl.format.Colour.BLACK);
            WritableCellFormat titleFormat = new WritableCellFormat(wfont);
            //设置Excel表头
            for (int i = 0; i < title.length; i++) {
                Label excelTitle = new Label(i, 0, title[i], titleFormat);
                wsheet.addCell(excelTitle);
            }
            int c = 1; //用于循环时Excel的行号
            Iterator<Object> it = jsonArray.iterator();
            while (it.hasNext()) {
                JSONObject ob = (JSONObject) it.next();
                Label content1 = new Label(0, c, ob.getString("name"));
                Label content2 = new Label(1, c, ob.getString("desc"));
                wsheet.addCell(content1);
                wsheet.addCell(content2);
                c++;
            }
            wbook.write(); //写入文件
            wbook.close();
            os.close();
            System.out.println("导入成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}