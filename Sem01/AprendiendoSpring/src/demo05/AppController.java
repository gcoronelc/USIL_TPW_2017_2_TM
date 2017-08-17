package demo05;

/**
 *
 * @author Gustavo Coronel
 */
public class AppController {

  private MateService service;
  private String nombre;
  private String ciudad;
  

  /**
   * Constructor por defecto
   */
  public AppController() {
  }
 

  /**
   * Inyección por constructor.
   * 
   * @param service 
   */
  public AppController(MateService service) {
    this.service = service;
  }

  
  /**
   * Otro constructor
   * @param service
   * @param nombre 
   */
  public AppController(MateService service, String nombre) {
    this.service = service;
    this.nombre = nombre;
    System.out.println("Hola " + nombre);
  }

  /**
   * Otro constructor
   * 
   * @param service
   * @param nombre
   * @param ciudad 
   */
  public AppController(MateService service, String nombre, String ciudad) {
    this.service = service;
    this.nombre = nombre;
    this.ciudad = ciudad;
    System.out.println("Hola " + nombre + " de " + ciudad);
  }

  
  
  
  public int sumar(int n1, int n2) {
    return this.service.sumar(n1, n2);
  }

}
