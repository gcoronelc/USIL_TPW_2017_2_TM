package demo05;

import demo04.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author Gustavo Coronel
 */
@Component
public class AppController {

  @Autowired
  private MateService service;

  public int sumar(int n1, int n2) {
    return this.service.sumar(n1, n2);
  }

}
