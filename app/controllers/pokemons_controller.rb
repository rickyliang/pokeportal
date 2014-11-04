class PokemonsController < ApplicationController

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer_id = current_trainer.id
		if @pokemon.save
			redirect_to trainer_path(@pokemon.trainer_id)
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to pokemons_path
		end
	end

	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health = @pokemon.health - 10
		if @pokemon.health <= 0
			@pokemon.destroy
		else
			@pokemon.save
		end
		redirect_to trainer_path(@pokemon.trainer_id)
	end


	private

	def pokemon_params
		params.require(:pokemon).permit(:name)
	end
end
