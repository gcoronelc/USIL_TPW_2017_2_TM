package demo02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Gustavo Coronel
 */
@Component
public class AppController {

  private MateService service;

  @Autowired   
  public void setService(MateService service) {
    this.service = service;
  }

  public int sumar(int n1, int n2) {
    return this.service.sumar(n1, n2);
  }

}
