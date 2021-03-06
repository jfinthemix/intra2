package proyecto_uoct.proyecto.controller;




import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import java.util.Date;
import proyecto_uoct.common.LocalizadorServicios;
import proyecto_uoct.common.*;
import java.util.List;
import java.util.Iterator;
import proyecto_uoct.usuario.model.UsuarioLocal;
import proyecto_uoct.usuario.VO.UsuarioVO;
import java.text.SimpleDateFormat;
import org.quartz.Job;
import proyecto_uoct.proyecto.model.ProyectoLocal;
import proyecto_uoct.proyecto.VO.BusOTVO;
import proyecto_uoct.proyecto.VO.DetalleOTVO;
import proyecto_uoct.EIV.model.EIVLocal;




public class MailAutoVenceOT implements Job {


    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

    public void execute(JobExecutionContext context) throws JobExecutionException {

          try {

              ProyectoLocal proyLocal = LocalizadorServicios.getInstance().getProyectoLocal();
              EIVLocal eivLocal= LocalizadorServicios.getInstance().getEIVLocal();
              UsuarioLocal usuLoc=LocalizadorServicios.getInstance().getUsuarioLocal();

              BusOTVO paramBusOT= new BusOTVO();
              paramBusOT.setFechaVenc(sdf.format(new Date()));
              List vencenHoy=proyLocal.buscarOT(paramBusOT);
              Iterator i=vencenHoy.iterator();
              while (i.hasNext()){
                  DetalleOTVO  detalleOT=(DetalleOTVO)i.next();
                  List encargadosOT= proyLocal.getEncargadosOT(detalleOT.getIdOT());

                  Iterator ienc= encargadosOT.iterator();
                  String para =null;
                  while(ienc.hasNext()){
                      UsuarioVO encargado=(UsuarioVO)ienc.next();
                      if (para==null) {
                          para=encargado.getEmail();
                      }else{
                          para+=","+ encargado.getEmail();
                      }

                  }


                  String contenido="Se comunica que la siguiente OT vence el d�a de hoy:\n\r"+
                                  "Nombre OT: "+detalleOT.getNomOT()+"\r\n"+
                                  "Proyecto: "+detalleOT.getDetProy().getNomProy()+"\r\n";

                  eivLocal.alertaEmail("sistema@uoct.cl","",para,"Aviso de Vencimiento de OT",contenido);
                  System.out.print("Email enviado");
              }

          } catch (LocalizadorServiciosException ex) {
          }catch(Exception e){
              System.out.print("Error en el env�o de Email el d�a de vencimiento de OT");
              e.printStackTrace();

          }


}
}
