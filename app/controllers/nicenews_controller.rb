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

    def edit
        @noticia = Noticia.find(params[:id])
    end
    
    def update
        @noticia = Noticia.find(params[:id])
        # @noticia.encabezado = noticia_params.encabezado
        # @noticia.cuerpo = noticia_params.cuerpo
        # @noticia.tipo = noticia_params.tipo
        if @noticia.update(noticia_params)
            redirect_to noticia_path
        else
            render :edit
        end
    end

    def delete
        @noticia = Noticia.find(params[:id])
        if @noticia.delete
            redirect_to nicenews_noticias_path
        else
            redirect_to noticia_path
        end
    end

    def buscar
        puts noticia_search['query_text']
        @noticias = Noticia.search_full_text(noticia_search['query_text'])
        puts @noticias.length()
        # puts @noticias[0].encabezado
    end

    private
    def noticia_params
        params.require(:formulario).permit(:encabezado, :cuerpo, :tipo)
    end
    def noticia_search
        params.require(:busqueda).permit([:query_text])
    end

end