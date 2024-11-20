import java.io.*;
import java.util.*;

/** Analyser des données d'un fichier, une donnée par ligne avec 4 informations
 * séparées par des blancs : x, y, ordre (ignorée), valeur.
 */
public class Analyseur {
	/** Conserve la somme des valeurs associées à une position. */
	private final Map<Position, Double> cumuls;

	/** Construire un analyseur vide. */
	public Analyseur() {
		cumuls = new HashMap<>();
	}

	/** Charger l'analyseur avec les données du fichier "donnees.java". */
	public void charger() {
		try (BufferedReader in = new BufferedReader(new FileReader("donnees.txt"))) {
			String ligne = null;
			while ((ligne = in.readLine()) != null) {
				final String[] mots = ligne.split("\\s+");
				assert mots.length == 4;	// 4 mots sur chaque ligne
				final int x = Integer.parseInt(mots[0]);
				final int y = Integer.parseInt(mots[1]);
				final Position p = new Position(x, y);
				final double valeur = Double.parseDouble(mots[3]);
				cumuls.put(p, valeur(p) + valeur);
				// p.setY(p.getY() + 1);	//  p.y += 1;
			}
		} catch (final IOException e) {
			throw new RuntimeException(e);
		}
	}

	/** Obtenir la valeur associée à une position. */
	public double valeur(final Position position) {
		final Double valeur = cumuls.get(position);
		return valeur == null ? 0.0 : valeur;
	}

	/** Obtenir toutes les données. */
	public Map<Position, Double> donnees() {
		return Collections.unmodifiableMap(this.cumuls);
	}

	/** Affichier les données. */
	public static void main(final String[] args) {
		final Analyseur a = new Analyseur();
		a.charger();
		System.out.println(a.donnees());
		System.out.println("Nombres de positions : " + a.donnees().size());
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cumuls == null) ? 0 : cumuls.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final Analyseur other = (Analyseur) obj;
		if (cumuls == null) {
			if (other.cumuls != null)
				return false;
		} else if (!cumuls.equals(other.cumuls))
			return false;
		return true;
	}
}
