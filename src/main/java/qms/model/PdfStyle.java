package qms.model;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Element;
import com.itextpdf.text.pdf.PdfPCell;
 
public class PdfStyle 
{
 
    public static void headerCellStyle(PdfPCell cell){
 
    // alignment
    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
 
    // padding
        cell.setPaddingTop(0f);
        cell.setPaddingBottom(7f);
 
        // background color
        cell.setBackgroundColor(new BaseColor(125,34,34));
 
        // border
        cell.setBorder(0);
        cell.setBorder(1);
        
           cell.setBorderWidthRight(0.5f);
           
        //   cell.setBorderWidthLeft(0.5f);
        cell.setBorderWidthBottom(2f);
 
    }
    public static void labelCellStyle(PdfPCell cell){
    // alignment
    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        // padding
        cell.setPaddingLeft(3f);
        cell.setPaddingTop(0f);
 
        // background color
        cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
 
        // border
        cell.setBorder(1);
        cell.setBorderWidthBottom(1);
        cell.setBorderColorBottom(BaseColor.GRAY);
 
        // height
        cell.setMinimumHeight(18f);
    }
 
    public static void valueCellStyle(PdfPCell cell){
    // alignment
    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
    cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
 
        // padding
        cell.setPaddingTop(0f);
        cell.setPaddingBottom(5f);
 
        // border
        cell.setBorder(1);
      //   cell.setBorderWidthTop(0.5f);
            cell.setBorderWidthRight(0.5f);
            cell.setBorderWidthBottom(0.5f);
            cell.setBorderWidthLeft(0.5f);
      
 
        // height
        cell.setMinimumHeight(18f);
    }
}