using Celeste.Mod.Entities;
using Microsoft.Xna.Framework;
using Monocle;

namespace Celeste.Mod.StunningHelper;

[CustomEntity("StunningHelper/CustomOffsetLightning")]
[TrackedAs(typeof(Lightning))]
[Tracked]
public class CustomOffsetLightning : Lightning
{
        public CustomOffsetLightning(EntityData data, Vector2 offset) : base(data, offset)
		{
			this.toggleOffset = data.Float("offset");
		}
}