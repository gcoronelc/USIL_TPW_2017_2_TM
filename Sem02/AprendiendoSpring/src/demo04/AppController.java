package demo04;

import javax.inject.Inject;
import javax.inject.Named;

/**
 *
 * @author Gustavo Coronel
 */
@Named
public class AppController {

  @Inject
  private MateService service;

  public int sumar(int n1, int n2) {
    return this.service.sumar(n1, n2);
  }

}
