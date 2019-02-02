package net.controller;

import net.model.Game;
import net.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GameController {
    private GameService gameService;

    @Autowired(required = true)
    @Qualifier(value = "gameService")
    public void setGameService(GameService gameService) {
        this.gameService = gameService;
    }

    @RequestMapping(value = "games", method = RequestMethod.GET)
    public String listGames(Model model){
        model.addAttribute("game", new Game());
        model.addAttribute("listGames", this.gameService.listGames());
        return "games";
    }

    @RequestMapping(value = "/games/add", method = RequestMethod.POST)
    public String addGame(@ModelAttribute("game") Game game){
        if(game.getId() == 0){
            this.gameService.addGame(game);
        }else {
            this.gameService.updateGame(game);
        }
        return "redirect:/games";
    }

    @RequestMapping("/remove/{id}")
    public String removeGame(@PathVariable("id") int id){
        this.gameService.removeGame(id);

        return "redirect:/games";
    }

    @RequestMapping("edit/{id}")
    public String editGame(@PathVariable("id") int id, Model model){
        model.addAttribute("game", this.gameService.getGameById(id));
        model.addAttribute("listGames", this.gameService.listGames());
        return "games";
    }

    @RequestMapping("gamedata/{id}")
    public String gameData(@PathVariable("id") int id, Model model){
        model.addAttribute("game", this.gameService.getGameById(id));
        return "redirect:/gamedata";
    }
}
