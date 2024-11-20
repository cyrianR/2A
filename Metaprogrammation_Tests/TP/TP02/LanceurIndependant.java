import java.lang.reflect.*;
import java.util.*;

/** L'objectif est de faire un lanceur simple sans utiliser toutes les clases
  * de notre architecture JUnit.   Il permet juste de valider la compréhension
  * de l'introspection en Java.
  */
public class LanceurIndependant {
	private int nbTestsLances;
	private int nbErreurs;
	private int nbEchecs;
	private List<Throwable> erreurs = new ArrayList<>();

	public LanceurIndependant(String... nomsClasses) {
	    System.out.println();

		// Lancer les tests pour chaque classe
		for (String nom : nomsClasses) {
			try {
				System.out.print(nom + " : ");
				this.testerUneClasse(nom);
				System.out.println();
			} catch (ClassNotFoundException e) {
				System.out.println(" Classe inconnue !");
			} catch (Exception e) {
				System.out.println(" Probleme : " + e);
				e.printStackTrace();
			}
		}

		// Afficher les erreurs
		for (Throwable e : erreurs) {
			System.out.println();
			e.printStackTrace();
		}

		// Afficher un bilan
		System.out.println();
		System.out.printf("%d tests lancés dont %d échecs et %d erreurs.\n",
				nbTestsLances, nbEchecs, nbErreurs);
	}


	public int getNbTests() {
		return this.nbTestsLances;
	}


	public int getNbErreurs() {
		return this.nbErreurs;
	}


	public int getNbEchecs() {
		return this.nbEchecs;
	}


	private void testerUneClasse(String nomClasse)
		throws ClassNotFoundException, InstantiationException,
						  IllegalAccessException
	{
		// Récupérer la classe
		Class<?> classe = Class.forName(nomClasse);

		// Récupérer les méthodes "preparer" et "nettoyer"
		Method preparer = null;
		Method nettoyer = null;
		try {
			preparer = classe.getMethod("preparer", null);
		} catch (NoSuchMethodException e) {
		}
		try {
			nettoyer = classe.getMethod("nettoyer", null);
		} catch (NoSuchMethodException e) {
		}

		// Instancier l'objet qui sera le r�cepteur des tests
		Object objet = null;
		try {
			objet = classe.getDeclaredConstructor().newInstance();
		} catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| NoSuchMethodException | SecurityException e) {
			System.err.println("La classe " + nomClasse + " n'a pas pu être instancié à l'aide de son constructeur.");
			e.printStackTrace();
			System.exit(0);
		}
		
		// Exécuter les méthods de test
		if (preparer != null) {
			try {
				preparer.invoke(objet);
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				System.err.println("La méthode preparer de la classe " + nomClasse + " n'a pas pu être invoquée.");
				e.printStackTrace();
			}
		}

		Method[] allMethods = classe.getMethods();
		for (Method m : allMethods) {
			if (m.getName().startsWith("test")) {
				String[] modifiers = Modifier.toString(m.getModifiers()).split(" ");
				if (modifiers.length == 1 && Arrays.asList(modifiers).contains("public")) {
					try {
						nbTestsLances++;
						m.invoke(objet);
					} catch (IllegalAccessException | IllegalArgumentException e) {
						System.err.println("La méthode " + m.getName() + " de la classe " + nomClasse + " n'a pas pu être invoquée.");
						this.nbErreurs++;
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						if (e.getCause() instanceof Echec) {
							this.nbEchecs++;
						} else {
							this.nbErreurs++;
						}
					}
				} else {
					System.err.println("La méthode " + m.getName() + " de la classe " + nomClasse + " n'a pas les bons modifiers pour un test et ne sera donc pas lancée.");
				}
			}
		}

		if (nettoyer != null) {
			try {
				nettoyer.invoke(objet);
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				System.err.println("La méthode " + " nettoyer de la classe " + nomClasse + " n'a pas pu être invoquée.");
				e.printStackTrace();
			}
		}
	}

	public static void main(String... args) {
		LanceurIndependant lanceur = new LanceurIndependant(args);
	}

}
