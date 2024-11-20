import java.util.HashMap;
import java.util.Map;

/** Evaluateur de la valeur d'une expression
  *
  * @author	Ragot Cyrian
  */
public class EvaluateurExpression implements VisiteurExpression<Integer> {

    Map<String, Integer> environnement;

    public EvaluateurExpression(HashMap<String, Integer> environnement) {
        this.environnement = environnement;
    }

    @Override
    public Integer visiterAccesVariable(AccesVariable v) {
        return environnement.get(v.getNom());
    }

    @Override
    public Integer visiterConstante(Constante c) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterConstante'");
    }

    @Override
    public Integer visiterExpressionBinaire(ExpressionBinaire e) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterExpressionBinaire'");
    }

    @Override
    public Integer visiterAddition(Addition a) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterAddition'");
    }

    @Override
    public Integer visiterMultiplication(Multiplication m) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterMultiplication'");
    }

    @Override
    public Integer visiterExpressionUnaire(ExpressionUnaire e) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterExpressionUnaire'");
    }

    @Override
    public Integer visiterNegation(Negation n) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterNegation'");
    }

    @Override
    public Integer visiterSoustraction(Soustraction s) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'visiterSoustraction'");
    }
        
}
