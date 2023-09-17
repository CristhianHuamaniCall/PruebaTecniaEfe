using FluentValidation;
using Microsoft.AspNetCore.Components.Forms;
using PT_GrupoEfeApi.Model;

namespace PT_GrupoEfeApi.Validator
{
    public class UsuarioValidator: AbstractValidator<RequestUsuarioModel>
    {
        public UsuarioValidator()
        {
            RuleFor(x => x.usuario).NotNull().NotEmpty().WithErrorCode("Debe Ingresar el Usuario");
            RuleFor(x => x.password).NotNull().NotEmpty().WithErrorCode("Debe Ingresar Password");


        }
    }
}
