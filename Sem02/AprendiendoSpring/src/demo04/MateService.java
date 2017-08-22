package demo04;

import javax.inject.Named;

/**
 *
 * @author Gustavo Coronel
 */
@Named
public class MateService {
  
  public int sumar(int n1, int n2){
    return (n1 + n2);
  }
          
    
}
