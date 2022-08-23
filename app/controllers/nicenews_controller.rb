class NicenewsController < ApplicationController
    def index 
    end

    def deportes 
    end

    def farandula 
    end

    def nacional
    end

    def internacional
    end

    def politica
    end

    def noticias
        @noticias = Noticia.all
    end

    def new

    end

    def show
        @noticia = Noticia.find(params[:id])
    end

    def create
        @noticia = Noticia.new(noticia_params)
        @noticia.save
        redirect_to nicenews_noticias_path
    end
    private
    def noticia_params
        params.require(:formulario).permit(:encabezado, :cuerpo, :tipo)
    end

end