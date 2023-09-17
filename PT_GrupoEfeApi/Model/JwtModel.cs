using PT_GrupoEfeApi.Utils;
using System.Security.Claims;

namespace PT_GrupoEfeApi.Model
{
    public class JwtModel
    {
        public string Key { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }    
        public string Subject { get; set; }

        public static dynamic validaToken(ClaimsIdentity identity)
        {
            try
            {
                if (identity.Claims.Count() == ConstantValue.NumberZero)
                {
                    return new
                    {
                        status = StatusCodes.Status401Unauthorized,
                        success = false,
                        message = "Token no valido",
                        result = ""
                    };
                }
                var id = identity.Claims.FirstOrDefault(x => x.Type == "id").Value;

                return new
                {
                    status = StatusCodes.Status200OK,
                    success = true,
                    message = "Ok",
                };

            }
            catch (Exception ex)
            {

                return new
                {
                    status = StatusCodes.Status400BadRequest,
                    success = false,
                    message = "Catch: " + ex.Message,
                    result = ""
                };
            }        
        }

    }
}
