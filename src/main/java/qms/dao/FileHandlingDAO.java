package qms.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletResponse;


public class FileHandlingDAO
{
	public static void filedownload(HttpServletResponse response,String referrence,String original) throws IOException
	{
		OutputStream outputStream = null;
        InputStream in = null;
        try {
            in = new FileInputStream(referrence);
            byte[] buffer = new byte[1024];
            int bytesRead = 0;
            response.setHeader("Content-Disposition","attachment;filename='"+original+"'");
            outputStream = response.getOutputStream();
            while( 0 < ( bytesRead = in.read( buffer ) ) )
            {
                outputStream.write( buffer, 0, bytesRead );
            }
            outputStream.flush();
            outputStream.close();
            
        }
       finally
        {
            if ( null != in )
            {
                in.close();
            }
        }
	}
	public void fileupload(HttpServletResponse response,String referrence,String original) throws IOException
	{
		OutputStream outputStream = null;
        InputStream in = null;
        try {
            in = new FileInputStream(referrence);
            byte[] buffer = new byte[1024];
            int bytesRead = 0;
            response.setHeader("Content-Disposition","attachment;filename='"+original+"'");
            outputStream = response.getOutputStream();
            while( 0 < ( bytesRead = in.read( buffer ) ) )
            {
                outputStream.write( buffer, 0, bytesRead );
            }
            outputStream.close();
        }
        finally
        {
            if ( null != in )
            {
                in.close();
            }
        }
	}
	
}