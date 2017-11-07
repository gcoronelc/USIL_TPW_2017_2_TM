package pe.egcc.edutec.model;

public class ResumenCursoModel {
  private String periodo;
  private String ciclo;
  private String tarifa;
  private String nomtarifa;
  private String curso;
  private String nomcurso;
  private Integer horas;
  private Double precio;
  private Double pagohora;
  private Integer secciones;
  private Integer vacantes;
  private Integer matriculados;
  private Integer disponibles;
  private Double ingresos;
  private Double pagoprof;
  private Double utilidad;

  public ResumenCursoModel() {
  }

  public String getPeriodo() {
    return periodo;
  }

  public void setPeriodo(String periodo) {
    this.periodo = periodo;
  }

  public String getCiclo() {
    return ciclo;
  }

  public void setCiclo(String ciclo) {
    this.ciclo = ciclo;
  }

  public String getTarifa() {
    return tarifa;
  }

  public void setTarifa(String tarifa) {
    this.tarifa = tarifa;
  }

  public String getNomtarifa() {
    return nomtarifa;
  }

  public void setNomtarifa(String nomtarifa) {
    this.nomtarifa = nomtarifa;
  }

  public String getCurso() {
    return curso;
  }

  public void setCurso(String curso) {
    this.curso = curso;
  }

  public String getNomcurso() {
    return nomcurso;
  }

  public void setNomcurso(String nomcurso) {
    this.nomcurso = nomcurso;
  }

  public Integer getHoras() {
    return horas;
  }

  public void setHoras(Integer horas) {
    this.horas = horas;
  }

  public Double getPrecio() {
    return precio;
  }

  public void setPrecio(Double precio) {
    this.precio = precio;
  }

  public Double getPagohora() {
    return pagohora;
  }

  public void setPagohora(Double pagohora) {
    this.pagohora = pagohora;
  }

  public Integer getSecciones() {
    return secciones;
  }

  public void setSecciones(Integer secciones) {
    this.secciones = secciones;
  }

  public Integer getVacantes() {
    return vacantes;
  }

  public void setVacantes(Integer vacantes) {
    this.vacantes = vacantes;
  }

  public Integer getMatriculados() {
    return matriculados;
  }

  public void setMatriculados(Integer matriculados) {
    this.matriculados = matriculados;
  }

  public Integer getDisponibles() {
    return disponibles;
  }

  public void setDisponibles(Integer disponibles) {
    this.disponibles = disponibles;
  }

  public Double getIngresos() {
    return ingresos;
  }

  public void setIngresos(Double ingresos) {
    this.ingresos = ingresos;
  }

  public Double getPagoprof() {
    return pagoprof;
  }

  public void setPagoprof(Double pagoprof) {
    this.pagoprof = pagoprof;
  }

  public Double getUtilidad() {
    return utilidad;
  }

  public void setUtilidad(Double utilidad) {
    this.utilidad = utilidad;
  }

}
