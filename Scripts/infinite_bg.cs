using Godot;
using System;

public class infinite_bg : Node
{
	public double puntaje = 0;
	public bool vivo = true;
	
	private Sprite[] backgrounds = new Sprite[5];
	private float bg_width = 1598f;
	
	private float move_speed = 400f;
	
	private float min_X = -1300f;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		for(int i = 1; i < 6; i++){
			backgrounds[i-1] = GetNode<Sprite>("Background" + i);
		}
	}

  // Called every frame. 'delta' is the elapsed time since the previous frame.
  public override void _Process(float delta)
  {
	  for(int i = 0; i < backgrounds.Length; i++){
		
		Vector2 temp = backgrounds[i].GetPosition();
		temp.x -= move_speed * delta;
		
		if(temp.x <= min_X){
			temp.x += bg_width * backgrounds.Length;
		}
		backgrounds[i].SetPosition(temp);
	}
	
	if(vivo){
		puntaje += 0.01;
		Area2D BotonReinicio = GetNode<Area2D>("BotonReinicio");
		Vector2 escala = new Vector2(0,0);
		BotonReinicio.Scale = escala;
		Label Puntaje = GetNode<Label>("CanvasLayer/puntaje");
		Puntaje.Text = Math.Round(puntaje,0).ToString();
	}else{
		Area2D BotonReinicio = GetNode<Area2D>("BotonReinicio");
		Vector2 escala = new Vector2(1,1);
		BotonReinicio.Scale = escala;
	}

  }


}

