using Microsoft.AspNetCore.Mvc;
using PT_GrupoEfeApi.Model;
using PT_GrupoEfeApi.Data;
using PT_GrupoEfeApi.Interface;
using PT_GrupoEfeApi.Utils;


namespace PT_GrupoEfeApi.Controllers
{
    [ApiController]
    [Route("api/usuario")]
    public class LoginController : ControllerBase
    {
        private readonly IGeneraToken _generaToken;
        public LoginController(IGeneraToken generaToken)
        {
            _generaToken = generaToken;
        }

        [HttpPost]
        [Route("login")]
        public async Task<ActionResult<ResponseUsuarioModel>> IniciarSesion(RequestUsuarioModel dataSesion)
        {
            ResponseUsuarioModel objE = new ResponseUsuarioModel();
            try
            {
                LoginData validate = new LoginData();
                objE = await validate.ValidateLogin(dataSesion);
                if (objE.Data.Count > ConstantValue.NumberZero)
                {
                    objE.Data[0].token = _generaToken.CreaToken(objE.Data[ConstantValue.NumberZero].usuario);
                }   
            }
            catch (Exception ex)
            {
                objE.error = true;
                objE.mensaje = ex.Message;
            }
            return objE;
        }


    }
}
