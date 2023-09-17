using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualBasic;
using PT_GrupoEfeApi.Data;
using PT_GrupoEfeApi.Interface;
using PT_GrupoEfeApi.Model;
using PT_GrupoEfeApi.Utils;
using System.Net;

namespace PT_GrupoEfeApi.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/pedido")]
    public class PedidoController : ControllerBase
    {
        [HttpPost]
        [Route("filtroPedido")]

        public async Task<ActionResult<ResponsePedidoModel>> GetPedido(RequestPedidoModel dataRequest)
        {
            ResponsePedidoModel objE = new ResponsePedidoModel();
            if (dataRequest.dni.Equals(string.Empty) || dataRequest.dni.Length == ConstantValue.NumberEight)
            {
                try
                {
                    PedidoData validate = new PedidoData();
                    objE = await validate.GetPedidoFiltro(dataRequest);
                }
                catch (Exception ex)
                {
                    objE.error = true;
                    objE.mensaje = ex.Message;
                }
            }
            else {
                objE.error = true;
                objE.mensaje = "Debe Mandar un el campo DNIo vacio o un DNI de 8 digitos";
            }

            return objE;

        }

        [HttpPost]
        [Route("detallePedido")]

        public async Task<ActionResult<ResponsePedidoModel>> GetPedidoDetalle(RequestDetallePedidoModel dataRequest)
        {
            RequestPedidoModel requestDetalle = new RequestPedidoModel();
            requestDetalle.pedidoID = dataRequest.pedidoID;
            requestDetalle.dni = string.Empty;

            ResponsePedidoModel objE = new ResponsePedidoModel();
            List<DetallePedidoModel> objD = new List<DetallePedidoModel>();

            if (dataRequest.pedidoID > 0)
            {
                try
                {
                    PedidoData pedido = new PedidoData();
                    objE = await pedido.GetPedidoFiltro(requestDetalle);
                    if (objE.Data.Count > 0)
                    {
                        PedidoData detallePedido = new PedidoData();
                        objD = await detallePedido.GetDetallePedido(requestDetalle);

                        objE.Data[0].DetallePedido = objD;
                    }
                }
                catch (Exception ex)
                {
                    objE.error = true;
                    objE.mensaje = ex.Message;
                }
            }
            else {
                objE.error = true;
                objE.mensaje = "Debe Ingresar un Numero De Pedido Valido...";
            }

            return objE;

        }

    }
}
