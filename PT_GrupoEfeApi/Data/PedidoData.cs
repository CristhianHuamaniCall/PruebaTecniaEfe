using PT_GrupoEfeApi.Utils;
using PT_GrupoEfeApi.Model;
using System.Data.SqlClient;
using System.Data;

namespace PT_GrupoEfeApi.Data
{
    public class PedidoData
    {
        ConnexionBD cn = new ConnexionBD();
        public async Task<ResponsePedidoModel> GetPedidoFiltro(RequestPedidoModel obj)
        {
            string error = string.Empty;
            ResponsePedidoModel EstPedido = new ResponsePedidoModel();
            List<PedidoModel> objPedido = new List<PedidoModel>();

            try
            {
                using (var sql = new SqlConnection(cn.cadenaSQL()))
                {
                    using (var cmd = new SqlCommand("Qry_pedidoFiltro", sql))
                    {
                        SqlParameter pPedidoID = cmd.Parameters.Add("@pedidoID", SqlDbType.Int);
                        SqlParameter pdni = cmd.Parameters.Add("@dni", SqlDbType.NVarChar);

                        pPedidoID.Value = obj.pedidoID;
                        pdni.Value = obj.dni;

                        await sql.OpenAsync();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        using (var item = await cmd.ExecuteReaderAsync())
                        {
                            while (await item.ReadAsync())
                            {
                                PedidoModel pedido = new PedidoModel();
                                pedido.pedidoID = (int)item["pedidoID"];
                                pedido.fecha = (DateTime)item["fecha"];
                                pedido.vendedor = (string)item["vendedor"];
                                pedido.dni = (string)item["dni"];
                                pedido.cliente = (string)item["cliente"];
                                objPedido.Add(pedido);
                            }
                        }
                    }
                }

                if (objPedido.Count > ConstantValue.NumberZero)
                {
                    EstPedido.size = objPedido.Count;
                    EstPedido.Data = objPedido;
                    EstPedido.confirmacion = "OK";
                    EstPedido.error = false;
                    EstPedido.mensaje = "Pedido Encontrado...";
                }
                else
                {
                    EstPedido.size = objPedido.Count;
                    EstPedido.Data = objPedido;
                    EstPedido.confirmacion = "Fail";
                    EstPedido.error = true;
                    EstPedido.mensaje = "No se encontró Pedído...";
                }

            }
            catch (Exception ex)
            {
                error = ex.Message;
                EstPedido.mensaje = error;
            }

            return EstPedido;
        }


        public async Task<List<DetallePedidoModel>> GetDetallePedido(RequestPedidoModel obj)
        {
            string error = string.Empty;
            List<DetallePedidoModel> objDetallePedido = new List<DetallePedidoModel>();
            try
            {
                using (var sql = new SqlConnection(cn.cadenaSQL()))
                {
                    using (var cmd = new SqlCommand("Qry_pedidoDetalle", sql))
                    {
                        SqlParameter pPedidoID = cmd.Parameters.Add("@pedidoID", SqlDbType.Int);

                        pPedidoID.Value = obj.pedidoID;

                        await sql.OpenAsync();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        using (var item = await cmd.ExecuteReaderAsync())
                        {
                            while (await item.ReadAsync())
                            {
                                DetallePedidoModel detallepedido = new DetallePedidoModel();
                                detallepedido.productoID = (int)item["productoID"];
                                detallepedido.producto = (string)item["producto"];
                                detallepedido.cantidad = (int)item["cantidad"];
                                detallepedido.precioUnitario = (decimal)item["precioUnitario"];
                                detallepedido.SubTotal = (decimal)item["SubTotal"];
                                objDetallePedido.Add(detallepedido);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                error = ex.Message;
            }

            return objDetallePedido;
        }




    }
}
