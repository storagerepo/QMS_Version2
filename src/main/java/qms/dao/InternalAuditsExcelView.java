package qms.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import qms.model.InternalAudits;

public class InternalAuditsExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		/*workbook.createName("InternalAudit_Report");*/
		HSSFSheet excelSheet = workbook.createSheet("Animal List");
		setExcelHeader(excelSheet);
		
		List<InternalAudits> internalAudits = (List<InternalAudits>) model.get("internalAudits");
		setExcelRows(excelSheet,internalAudits);
		
	}

	public void setExcelHeader(HSSFSheet excelSheet) {
		HSSFRow excelHeader = excelSheet.createRow(0);
		excelHeader.createCell(0).setCellValue("Id");
		excelHeader.createCell(1).setCellValue("Name");
		excelHeader.createCell(2).setCellValue("Type");
		excelHeader.createCell(3).setCellValue("Aggressive");
		excelHeader.createCell(4).setCellValue("Weight");
	}
	
	public void setExcelRows(HSSFSheet excelSheet, List<InternalAudits> internalAudits){
		int record = 1;
		for (InternalAudits internalAudits2:internalAudits) {
			HSSFRow excelRow = excelSheet.createRow(record++);
			excelRow.createCell(0).setCellValue(internalAudits2.getId());
			excelRow.createCell(1).setCellValue(internalAudits2.getAudit_due_date());
			excelRow.createCell(2).setCellValue(internalAudits2.getAudit_start_date());
			excelRow.createCell(3).setCellValue(internalAudits2.getAuditors_initials());
			excelRow.createCell(4).setCellValue(internalAudits2.getCompletion_date());
		}
	}
}
