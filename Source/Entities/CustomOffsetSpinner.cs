using Celeste.Mod.Entities;
using Microsoft.Xna.Framework;
using Monocle;
using Celeste;

namespace Celeste.Mod.StunningHelper;



[CustomEntity("StunningHelper/CustomOffsetSpinner")]

[TrackedAs(typeof(CrystalStaticSpinner))]
public class CustomOffsetSpinner : CrystalStaticSpinner
{
public CustomOffsetSpinner(EntityData data, Vector2 offset) : base(data, offset, (data.Attr("color") == "blue" ? CrystalColor.Blue : (data.Attr("color") == "red" | data.Attr("color") == "core") ? CrystalColor.Red : data.Attr("color") == "purple" ? CrystalColor.Purple : CrystalColor.Rainbow))
{
	// I don't know a better way to do the crystal colors I hate crystal colors
	this.offset = data.Float("offset");
}
}
