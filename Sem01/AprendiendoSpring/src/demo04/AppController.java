package demo04;

/**
 *
 * @author Gustavo Coronel
 */
public class AppController {

  private MateService service;

  public AppController() {
  }
  
  /**
   * Para realizar la inyección.
   * @param service 
   */
  public void setService(MateService service) {
    this.service = service;
  }

  public int sumar(int n1, int n2) {
    return this.service.sumar(n1, n2);
  }

}
