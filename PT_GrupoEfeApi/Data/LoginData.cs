using PT_GrupoEfeApi.Utils;
using PT_GrupoEfeApi.Model;
using PT_GrupoEfeApi.Utils;
using System.Data;
using System.Data.SqlClient;


namespace PT_GrupoEfeApi.Data
{
    public class LoginData
    {
        ConnexionBD cn = new ConnexionBD();

        public async Task<ResponseUsuarioModel> ValidateLogin(RequestUsuarioModel obj)
        {
            string error=string.Empty;
            ResponseUsuarioModel EstUsuario = new ResponseUsuarioModel();
            List<UsuarioModel> objUsuario = new List<UsuarioModel>();

            try
            {
                using (var sql = new SqlConnection(cn.cadenaSQL()))
                {
                    using (var cmd = new SqlCommand("Qry_validateLogin", sql))
                    {
                        SqlParameter pUsuario = cmd.Parameters.Add("@usuario", SqlDbType.NVarChar);
                        SqlParameter pPassword = cmd.Parameters.Add("@password", SqlDbType.NVarChar);

                        pUsuario.Value = obj.usuario;
                        pPassword.Value = obj.password;

                        await sql.OpenAsync();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        using (var item = await cmd.ExecuteReaderAsync())
                        {
                            while (await item.ReadAsync())
                            {
                                UsuarioModel login = new UsuarioModel();
                                login.usuarioID = (int)item["usuarioID"];
                                login.usuario = (string)item["usuario"];
                                login.rolID = (int)item["rolID"];
                                login.rol = (string)item["rol"];
                                login.abreviatura = (string)item["abreviatura"];
                                objUsuario.Add(login); 
                            }
                        }
                    }
                }

                if (objUsuario.Count > ConstantValue.NumberZero)
                {
                    EstUsuario.size = objUsuario.Count;
                    EstUsuario.Data = objUsuario;
                    EstUsuario.confirmacion = "OK";
                    EstUsuario.error = false;
                    EstUsuario.mensaje = "Bienvenido...";
                }
                else 
                {
                    EstUsuario.size = objUsuario.Count;
                    EstUsuario.Data = objUsuario;
                    EstUsuario.confirmacion = "Fail";
                    EstUsuario.error = true;
                    EstUsuario.mensaje = "Revisar su usuario o contraseña";
                }


            }
            catch (Exception ex)
            {
                error = ex.Message;
                EstUsuario.mensaje = error;
            }

            return EstUsuario;
        }


    }

}
