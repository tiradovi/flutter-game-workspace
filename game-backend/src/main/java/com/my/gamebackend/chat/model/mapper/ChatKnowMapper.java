package com.my.gamebackend.chat.model.mapper;

import com.my.gamebackend.chat.model.dto.ChatbotContext;
import com.my.gamebackend.chat.model.dto.ChatbotIntent;
import com.my.gamebackend.chat.model.dto.ChatbotKnowledge;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ChatKnowMapper {
    ChatbotKnowledge findByKeyword(String keyword);

    List<ChatbotKnowledge> findByCategory(String category);

    List<ChatbotKnowledge> findAllActive();

    ChatbotIntent findIntentByName(String intentName);

    ChatbotIntent findIntentByPattern(String pattern);

    List<ChatbotIntent> findAllIntents();

    void saveContext(ChatbotContext context);

    ChatbotContext getContext(@Param("converstaionId") Long converstationId, @Param("contextKey") String contextKey);

    void deleteExpiredContext();
}
