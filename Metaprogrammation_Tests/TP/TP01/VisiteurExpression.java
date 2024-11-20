/**
  * Visiteur sur une expression arithm�tique.
  *
  * @author	Xavier Cr�gut
  * @version	$Revision$
  */
public interface VisiteurExpression<R> {

	/** Visiter un acc�s � une variable.
	  * @param v l'acc�s � une variable � visiter
	  */
	R visiterAccesVariable(AccesVariable v);

	/** Visiter une constante.
	  * @param c la constante � visiter
	  */
	R visiterConstante(Constante c);

	/** Visiter une expression binaire.
	  * @param e l'expression binaire � visiter
	  */
	R visiterExpressionBinaire(ExpressionBinaire e);

	/** Visiter l'op�rateur binaire addition.
	  * @param a l'op�rateur � visiter
	  */
	R visiterAddition(Addition a);

	/** Visiter l'op�rateur binaire multiplication.
	  * @param m l'op�rateur � visiter
	  */
	R visiterMultiplication(Multiplication m);

	/** Visiter une expression unaire.
	  * @param v l'expression unaire � visiter
	  */
	R visiterExpressionUnaire(ExpressionUnaire e);

	/** Visiter un op�rateur unaire n�gation.
	  * @param n l'op�rateur unaire � visiter
	  */
	R visiterNegation(Negation n);

	/** Visiter un opérateur binaire soustraction.
	  * @param s l'op�rateur binaire � visiter
	  */
	  R visiterSoustraction(Soustraction s);

}
