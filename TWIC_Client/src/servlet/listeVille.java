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

import dto.Ville;

/**
 * Servlet implementation class listeVille
 */
@WebServlet("/listeVille")
public class listeVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VUE_FORM = "/listeVille.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listeVille() {
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
		List<Ville> listeVille = new ArrayList<>();
		for(int i=0;i<liste.size();i++) {
			Ville ville = new Ville();
			obj = liste.getJsonObject(i);
			ville.setCode(obj.getInt("code"));
			ville.setCodePostale(obj.getInt("code"));
			ville.setLatitude(obj.getJsonNumber("latitude").doubleValue());
			ville.setLibelle(obj.getString("libelle"));
			ville.setLigne5(obj.getString("ligne5"));
			ville.setLongitude(obj.getJsonNumber("longitude").doubleValue());
			ville.setNom(obj.getString("nom"));
			listeVille.add(ville);
		}
		
		request.setAttribute("listeVille", listeVille);
		this.getServletContext().getRequestDispatcher(VUE_FORM).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
