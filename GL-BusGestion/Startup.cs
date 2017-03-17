using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GL_BusGestion.Startup))]
namespace GL_BusGestion
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
