using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SandrelenaWebApplication.Startup))]
namespace SandrelenaWebApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
