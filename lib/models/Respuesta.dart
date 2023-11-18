class Respuesta {
  bool respuestaCorrecta = false;
  String mensajeRespuesta = "";
  bool get getRespuestaCorrecta => this.respuestaCorrecta;

  set setRespuestaCorrecta(bool respuestaCorrecta) =>
      this.respuestaCorrecta = respuestaCorrecta;

  get getMensajeRespuesta => this.mensajeRespuesta;

  set setMensajeRespuesta(mensajeRespuesta) =>
      this.mensajeRespuesta = mensajeRespuesta;
}
