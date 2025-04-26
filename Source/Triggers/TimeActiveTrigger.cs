using Celeste.Mod.Entities;
using Microsoft.Xna.Framework;

namespace Celeste.Mod.StunningHelper;

[CustomEntity("StunningHelper/TimeActiveTrigger")]

public class TimeActiveTrigger : Trigger {
    private float TimeActive;
    private bool Enter;
    private bool Stay;
    private bool Leave;
    public TimeActiveTrigger(EntityData data, Vector2 offset) 
        : base(data, offset) {
            TimeActive = data.Float("TimeActive");
            Enter = data.Bool("OnEnter");
            Stay = data.Bool("OnStay");
            Leave = data.Bool("OnLeave");
    }

    public override void OnEnter(Player player) {
        base.OnEnter(player);
        if (Enter){
            (Scene as Level).TimeActive = TimeActive;
        }
    }

    public override void OnStay(Player player) {
        base.OnStay(player);
        if (Stay){
            (Scene as Level).TimeActive = TimeActive;
        }
    }

    public override void OnLeave(Player player) {
        base.OnLeave(player);
        if (Leave){
            (Scene as Level).TimeActive = TimeActive;
        }
    }

}
