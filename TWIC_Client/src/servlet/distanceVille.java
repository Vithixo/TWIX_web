package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class distanceVille
 */
@WebServlet("/distanceVille")
public class distanceVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VUE_FORM = "/distanceVille.jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public distanceVille() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		URL url = new URL("http://localhost:8181/ville");
		InputStream is = url.openStream();
		JsonReader rdr = Json.createReader(is) ;
		JsonArray liste = rdr.readArray();
		
		JsonObject obj;
		List<String> listeVille = new ArrayList<>();
		List<Double> listeLongitude = new ArrayList<>();
		List<Double> listeLatitude = new ArrayList<>();
		for(int i=0;i<liste.size();i++) {
			obj = liste.getJsonObject(i);
			listeVille.add(obj.getString("nom"));
			listeLatitude.add(obj.getJsonNumber("latitude").doubleValue());
			listeLongitude.add(obj.getJsonNumber("longitude").doubleValue());			
		}
		
		request.setAttribute("listeVille", listeVille);
		request.setAttribute("listeLongitude", listeLatitude);
		request.setAttribute("listeLatitude", listeLongitude);
		this.getServletContext().getRequestDispatcher(VUE_FORM).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("distance", 8);
		doGet(request, response);
	}

}
