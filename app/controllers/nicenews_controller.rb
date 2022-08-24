class NicenewsController < ApplicationController
    def index 
    end

    def deportes 
        @noticias = Noticia.where("tipo = ?",1)
        puts @noticias.length
    end

    def farandula 
        @noticias = Noticia.where("tipo = ?",2)
        puts @noticias.length
    end

    def nacional
        @noticias = Noticia.where("tipo = ?",3)
        puts @noticias.length
    end

    def internacional
        @noticias = Noticia.where("tipo = ?",4)
        puts @noticias.length
    end

    def politica
        @noticias = Noticia.where("tipo = ?",5)
        puts @noticias.length
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