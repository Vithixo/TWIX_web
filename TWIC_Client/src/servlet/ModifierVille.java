package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
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
@WebServlet("/ModifierVille")
public class ModifierVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String VUE_FORM = "/modifierVille.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierVille() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		URL url = new URL("http://localhost:8181/ville?code="+code);
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
		String code = request.getParameter("code");
		String nom = request.getParameter("nom");
		String libelle = request.getParameter("libelle");
		String ligne5 = request.getParameter("ligne5");
		String codePostal = request.getParameter("codePostal");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		String requete = "http://localhost:8181/ville?code="+code+"&nom="+nom+"&libelle="+libelle+"&codePostal="+codePostal+"&latitude="+latitude+"&longitude="+longitude;
		requete = requete.replace(" ", "%");
		URL url = new URL(requete);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("PUT");
		int responseCode = connection.getResponseCode();
		
		List<String> success = new ArrayList<>();
		success.add("La Ville a bien été modifiée");
		request.setAttribute("success",success );
		request.setAttribute("code", code);
		
		doGet(request, response);
	}

}
