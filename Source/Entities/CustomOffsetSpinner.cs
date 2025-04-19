using Celeste.Mod.Entities;
using Microsoft.Xna.Framework;
using Monocle;
using Celeste;

namespace Celeste.Mod.StunningHelper;



[CustomEntity("StunningHelper/CustomOffsetSpinner")]

[TrackedAs(typeof(CrystalStaticSpinner))]
[Tracked]
public class CustomOffsetSpinner : CrystalStaticSpinner
{
public CustomOffsetSpinner(EntityData data, Vector2 offset) : base(data, offset, (data.Attr("color")=="core" ? (CrystalColor)(-1) : data.Enum<CrystalColor>("color")))
{
	this.offset = data.Float("offset");
}
}
