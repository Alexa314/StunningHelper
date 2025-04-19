using Celeste.Mod.Entities;
using Microsoft.Xna.Framework;
using Monocle;

namespace Celeste.Mod.StunningHelper;

[CustomEntity("StunningHelper/CustomOffsetDustBunny")]

[TrackedAs(typeof(DustStaticSpinner))]
[Tracked]
public class CustomOffsetDustBunny : DustStaticSpinner
{
        public CustomOffsetDustBunny(EntityData data, Vector2 offset) : base(data, offset)
		{
			this.offset = data.Float("offset");
		}
}