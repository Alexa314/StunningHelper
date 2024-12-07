using Celeste.Mod.Entities;
using Microsoft.Xna.Framework;
using Monocle;

namespace Celeste.Mod.StunningHelper;

[CustomEntity("StunningHelper/CustomOffsetSpinner")]

[TrackedAs(typeof(CrystalStaticSpinner))]
public class CustomOffsetSpinner : CrystalStaticSpinner
{
public CustomOffsetSpinner(EntityData data, Vector2 offset, CrystalColor color) : base(data, offset, color)
{
	this.offset = data.Float("offset");
}
}